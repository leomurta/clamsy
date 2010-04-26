module Clamsy
  class ShellPrinter < BasePrinter

    # The folder where cups-pdf generated pdfs are stored:
    # * in archlinux, this is specified in /etc/cups/cups-pdf.conf
    PDF_OUTPUT_DIR = "/tmp/cups-pdf/#{`whoami`.strip}"

    # The openoffice command to print odt to pdf, requires package cups-pdf & 'Cups-PDF' printer
    # to be set up in cups.
    ODT_TO_PDF_CMD = "ooffice -norestore -nofirststartwizard -nologo -headless -pt Cups-PDF"

    class << self

      private

        def odt_to_pdf(odt_path)
          system("#{ODT_TO_PDF_CMD} #{odt_path}")
          pdf_path = File.join(PDF_OUTPUT_DIR, File.basename(odt_path, '.odt')) + '.pdf'
          file_must_exist!(pdf_path, 10) ; pdf_path
        end

    end
  end
end
